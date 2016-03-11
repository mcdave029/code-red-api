# == Schema Information
#
# Table name: users
#
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  contact             :string
#  created_at          :datetime         not null
#  id                  :integer          not null, primary key
#  name                :string
#  updated_at          :datetime         not null
#

class Responder < User
end
