defmodule Streamers do

  def find_index(directory) do
    files = Path.join(directory, "*.m3u8")
    if file = Enum.find(Path.wildcard(files), is_index?(&1)) do
      file
    end
  end

  def is_index?(file) do
    File.open! file, fn
      "#EXTM3U\n#EXT-X-STREAM-INF" <> _ -> true
      _ -> false
    end
  end
end
