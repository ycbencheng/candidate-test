<% if current_user.nil? %>
  <li><%= user.email %> - <%= user.role %></li>
<% else %>
  <li><%= link_to user.email, edit_user_path(user)%> <%= user.role %></li>
<% end %>