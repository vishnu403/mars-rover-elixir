require Coordinate
require Plateau
require Rover

defmodule Deploy do

  def move(%{:coordinate => coordinate, :direction => "N"} = rover, "L",_) do
     %{:coordinate => rover.coordinate,:direction => "W"}
  end

  def move(%{:coordinate => coordinate, :direction => "N"} = rover, "R",_) do
     %{:coordinate => rover.coordinate,:direction => "E"}
  end

  def move(%{:coordinate => coordinate, :direction => "N"} = rover, "M",plateau) do
     cond do
       rover.coordinate.y+1 <= plateau.top_coordinate.y ->
         rover_new_position = %Coordinate{:x => rover.coordinate.x,:y => rover.coordinate.y+1}
         %{:coordinate => rover_new_position,:direction => rover.direction}
       true ->
         rover
     end
  end




  def move(%{:coordinate => coordinate, :direction => "S"} = rover, "L",_) do
     %{:coordinate => rover.coordinate,:direction => "E"}
  end

  def move(%{:coordinate => coordinate, :direction => "S"} = rover, "R",_) do
     %{:coordinate => rover.coordinate,:direction => "W"}
  end

  def move(%{:coordinate => coordinate, :direction => "S"} = rover, "M",plateau) do
    cond do
      rover.coordinate.y-1 >= plateau.bottom_coordinate.y ->
        rover_new_position = %Coordinate{:x => rover.coordinate.x,:y => rover.coordinate.y-1}
        %{:coordinate => rover_new_position,:direction => rover.direction}
      true ->
        rover
    end
  end




  def move(%{:coordinate => coordinate, :direction => "E"} = rover, "L",_) do
     %{:coordinate => rover.coordinate,:direction => "N"}
  end

  def move(%{:coordinate => coordinate, :direction => "E"} = rover, "R",_) do
     %{:coordinate => rover.coordinate,:direction => "S"}
  end

  def move(%{:coordinate => coordinate, :direction => "E"} = rover, "M",plateau) do
    cond do
      rover.coordinate.x+1 <= plateau.top_coordinate.x ->
        rover_new_position = %Coordinate{:x => rover.coordinate.x+1,:y => rover.coordinate.y}
        %{:coordinate => rover_new_position,:direction => rover.direction}
      true ->
        rover
    end
  end




  def move(%{:coordinate => coordinate, :direction => "W"} = rover, "L",_) do
     %{:coordinate => rover.coordinate,:direction => "S"}
  end

  def move(%{:coordinate => coordinate, :direction => "W"} = rover, "R",_) do
     %{:coordinate => rover.coordinate,:direction => "N"}
  end

  def move(%{:coordinate => coordinate, :direction => "W"} = rover, "M",plateau) do
    cond do
      rover.coordinate.x-1 >= plateau.bottom_coordinate.x ->
        rover_new_position = %Coordinate{:x => rover.coordinate.x-1,:y => rover.coordinate.y}
        %{:coordinate => rover_new_position,:direction => rover.direction}
      true ->
        rover
    end
  end

  # plateau = %{:top_coordinate => %Coordinate{:x => 5,:y => 5}, :bottom_coordinate => %Coordinate{:x => 0, :y => 0}}
  # rover = %{:coordinate => %Coordinate{:x => 1,:y => 2}, :direction => "N"}

def start(rover,plateau) do
   path = IO.gets("Enter the path for the rover ")|>String.trim()|>String.graphemes()
   rover = Enum.reduce(path, rover, fn(x, rover) -> rover = move(rover,x,plateau) end)
   IO.puts inspect(rover)
end
end
