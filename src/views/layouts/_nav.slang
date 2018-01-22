- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/categories" ? "active" : ""
a class="nav-item #{active}" href="/categories" Categories
- active = context.request.path == "/posts" ? "active" : ""
a class="nav-item #{active}" href="/posts" Posts
- active = context.request.path == "/post_comments" ? "active" : ""
a class="nav-item #{active}" href="/post_comments" Post Comments

- if (current_user = context.current_user)
  a.nav-item.pull-right href="/signout"
    | Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/profile"
    == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signup"
    | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signin"
    | Sign In
