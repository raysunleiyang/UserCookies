json.extract! @user, :id, :email, :dueDate, :originalReferringUrl, :userId, :createdDate, :createdBy, :modifitedDate, :modifitedBy
json.tags @user.tags, :tag
json.history @user.histories, :url