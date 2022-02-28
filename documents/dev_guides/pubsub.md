This is a list of any internal pubsubs (using Phoenix.PubSub) that can be broadcast. Anything broadcasting from the endpoint
is designed to be consumed by the browser/channel code while `PubSub.broadcast` is for internal/backend processes.


#### application
```
  {:application, :prep_stop}
```

#### account_hooks
```
  {:account_hooks, :create_user, user, :create}
  {:account_hooks, :update_user, user, :update}

  {:account_hooks, :create_report, report}
  {:account_hooks, :update_report, report, :create | :respond | :update}
```
