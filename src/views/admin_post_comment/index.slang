div.row
  div.col-sm-11
    h2 Post Comments
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/post_comments/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Post
        th Writer
        th Body
        th Actions
    tbody
    - post_comments.each do |post_comment|
      tr
        td = post_comment.post.title
        td = post_comment.user.email
        td = post_comment.body
        td
          span
            == link_to("read", "/post_comments/#{post_comment.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/post_comments/#{post_comment.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/post_comments/#{ post_comment.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
