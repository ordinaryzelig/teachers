module RegistrationHelper

private

  def amid_registration?
    flash[:registration].present?
  end

  def mark_registration_action
    flash[:registration] = true
  end

end
