module ApplicationHelper
  def nav_title(name)
    nav_hash = {
      'categories' => 'CATEGORIES',
      'operations' => 'OPERATIONS',
      'sessions' => 'LOGIN',
      'registrations' => 'SIGNUP'
    }

    if nav_hash.has_key(name)
      return nav_hash[name]
    else
      return ''
    end
  end
end
