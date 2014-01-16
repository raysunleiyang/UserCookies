json.extract! @user, :uuid, :email, :dueDate, :originalReferringUrl, :userId, :createdDate, :createdBy, :modifitedDate, :modifitedBy, :created_at, :updated_at
json.tags @user.tags, :tag
json.history @user.histories, :url