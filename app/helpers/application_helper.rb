# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def date_time(str)
    return '' unless str
    str.strftime('%b %d, %Y - %H:%M')
  end

  def date(str)
    return '' unless str
    str.strftime('%b %d, %Y')
  end

  def delete_link(text, path, options)
    link_to text, path,
            method: :delete,
            data: {
              confirm: 'This can\'t be undone',
              confirm_title: 'Are you sure ?',
              confirm_fade: true,
              confirm_cancel: 'No, keep all as is',
              confirm_proceed: 'Yes, I understand'
            },
            class: options[:class]
  end
end
