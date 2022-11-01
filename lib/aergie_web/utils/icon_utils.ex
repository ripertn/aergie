defmodule AergieWeb.Utils.IconUtils do
  @moduledoc"""
  tool to use icons

  2 functions to add svg to html.

  IconUtils.render() will create function to render svg at compile time.

  IconUtils.icon_tag will read svg at run time everytime icon is requested by a client

  """
  use Phoenix.HTML
  alias AergieWeb.Router.Helpers, as: Routes

  # IconUtils.render("fa-heart.svg", class: "some_class")
  for file_path <- Path.wildcard("priv/static/images/svg/*.svg") do
    # name + content of the file
    basename = Path.basename(file_path) |> IO.inspect()
    svg = File.read!(file_path)

    # Extract the attributes, which we cannot determine 
    width = case Regex.named_captures(~r/width=\"(?<attr>.*?)\"/, svg) do
      %{"attr" => width} -> width
      nil -> "24"
    end
    height = case Regex.named_captures(~r/height=\"(?<attr>.*?)\"/, svg) do
      %{"attr" => height} -> height
      nil -> "24"
    end
    %{"attr" => viewbox} = Regex.named_captures(~r/viewBox=\"(?<attr>.*?)\"/, svg)
    %{"attr" => path} = Regex.named_captures(~r/<path d=\"(?<attr>.*?)\"/, svg)

    # Build the function for the current svg file filling in the blanks
    def render(unquote("" <> basename), opts) do
      path = unquote(path) |> IO.inspect()
      svg_opts = [width: unquote(width), height: unquote(height), viewBox: unquote(viewbox)]

      content_tag :svg, opts ++ base_opts() ++ svg_opts do
        tag(:path, d: path)
      end
    end
  end

  defp base_opts, do: [xmlns: "http://www.w3.org/2000/svg"]


  def icon_tag(conn, name, opts \\ []) do
    classes = Keyword.get(opts, :class, "") == "" && "icon" || Keyword.get(opts, :class, "")
    content_tag(:svg, class: classes) do
      tag(:use, href: Routes.static_path(conn, "/images/icons.svg#" <> name))
    end
  end
end