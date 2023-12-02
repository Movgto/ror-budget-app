module ApplicationHelper
  def nav_title(name)
    nav_hash = {
      'categories' => 'CATEGORIES',
      'operations' => 'OPERATIONS',
      'sessions' => 'LOGIN',
      'registrations' => 'SIGNUP'
    }

    return nav_hash[name] if nav_hash.key?(name)


    ''
  end
end
