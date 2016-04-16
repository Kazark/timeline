
import RootComponent

import StartApp
import Task
import Effects
import Html

app : StartApp.App RootComponent.Model
app =
  StartApp.start
    { view = RootComponent.view
    , update = RootComponent.update
    , init = RootComponent.init
    , inputs = []
    }

main : Signal Html.Html
main =
  app.html

port tasks : Signal (Task.Task Effects.Never ())
port tasks =
  app.tasks
