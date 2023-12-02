module ApplicationHelper
  def nav_title(name)
    puts 'Action name:', name
    case name
    when 'categories'
      'CATEGORIES'
    when 'operations'
      'TRANSACTIONS'
    when 'sessions'
      'LOGIN'
    when 'registrations'
      'SIGNUP'
    end
  end
end
