Trestle.resource(:restaurants, model: Restaurant, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :restaurants, icon: "fas fa-users"
    end
  end

  table do
    column :name
    column :email, link: true
    column :address
    column :opening
    column :closing
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |restaurant|
    text_field :name
    text_field :email
    text_field :address
    text_field :phone
    time_field :opening
    time_field :closing

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
  end

  # Ignore the password parameters if they are blank
  update_instance do |instance, attrs|
    if attrs[:password].blank?
      attrs.delete(:password)
      attrs.delete(:password_confirmation) if attrs[:password_confirmation].blank?
    end

    instance.assign_attributes(attrs)
  end

  # Log the current user back in if their password was changed
  after_action on: :update do
    if instance == current_user && instance.encrypted_password_previously_changed?
      login!(instance)
    end
  end if Devise.sign_in_after_reset_password
end
