# developer log





## 2022 10 06

-> goal: change main picture -> OK
-> goal: add a link to item list, from the root "/" page  

1) d'où le module Aergie.PageController, lie "index.html" au fichier templates/page/index.html.heex ?



"When a template is compiled into a view, it is simply compiled as a render/2 function that expects two arguments: the template name and the assigns."


## 2022 10 07

Phoenix.View.render_to_string(AergieWeb.PageView, "index.html", message: "toto")


__Each of these plugs have a specific responsibility that we will learn later. The last plug is precisely the HelloWeb.Router module. This allows the endpoint to delegate all further request processing to the router. As we now know, its main responsibility is to map verb/path pairs to controllers. The controller then tells a view to render a templateEach of these plugs have a specific responsibility that we will learn later. The last plug is precisely the HelloWeb.Router module. This allows the endpoint to delegate all further request processing to the router. As we now know, its main responsibility is to map verb/path pairs to controllers. The controller then tells a view to render a template__



## 2022 10 30

- aergie logo created with https://app.svgator.com/#/
- add logo to project
- important message display
- add select in type of item
- add icon for actions on items
- add click on line to show detail of action

## 2022 11 02

- add API handler for AlphaVantage and Quandle

## 2022 11 07

- add new field "mnemo" using "mix ecto.gen.migration add_mnemo_to_item", see https://hexdocs.pm/ecto_sql/Ecto.Migration.html#alter/2


## 2022 11 10

- add automatic puller to alphaVantage to get last price of every action, for the day before


## 2023 01 21

git shortlog --summary --numbered --email

## 2023-05-27



