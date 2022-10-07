# developer log





## 2022 10 06

-> goal: change main picture -> OK

-> goal: add a link to item list, from the root "/" page  

1) d'où le module Aergie.PageController, lie "index.html" au fichier templates/page/index.html.heex ?



"When a template is compiled into a view, it is simply compiled as a render/2 function that expects two arguments: the template name and the assigns."


## 2022 10 07

Phoenix.View.render_to_string(AergieWeb.PageView, "index.html", message: "toto")


__Each of these plugs have a specific responsibility that we will learn later. The last plug is precisely the HelloWeb.Router module. This allows the endpoint to delegate all further request processing to the router. As we now know, its main responsibility is to map verb/path pairs to controllers. The controller then tells a view to render a templateEach of these plugs have a specific responsibility that we will learn later. The last plug is precisely the HelloWeb.Router module. This allows the endpoint to delegate all further request processing to the router. As we now know, its main responsibility is to map verb/path pairs to controllers. The controller then tells a view to render a template__

