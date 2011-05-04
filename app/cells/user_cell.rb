class UserCell < Cell::Rails

  def usernav(args)
    if args[:signed_in]
    render :text => "vrai"
  else
    render :text => '#{<%= link_to "Sign up", new_user_registration_path() %> or <%= link_to "sign in", new_user_session_path() %>}'
  end
    
  end

  def test
    if true
    render :text => 'Signed in as <%= current_user.email %> . Not you? 
		<%= link_to "Sign out", destroy_user_session_path()%>'
  else
    render :text => '<%= link_to "Sign up", new_user_registration_path() %> or <%= link_to "sign in", new_user_session_path() %>'
  end
  end
end
