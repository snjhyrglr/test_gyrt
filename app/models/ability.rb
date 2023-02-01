class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    alias_action :create, :read, :update, :destroy, :to => :crud

    case user
    when Employee
      can [:read, :create], Employee, id: user
      
      if user.id == 51 # jayson
        can :manage, :all
      end
      if user.id == 6 # actuarial
        can [:read, :update, :update_actuarial_status], GyrtProposal
        can :crud, [GyrtLoading, GyrtRate, GyrtRateMultiplier] 
        
      end 
      if user.id == 9 # underwriting head
        can [:read, :update, :update_underwriting_status, :to_pdf], GyrtProposal
        can [:read, :update_und], GyrtAgreement
        can [:selected], GeoRegion
        can [:selected], GeoProvince
        can [:selected], GeoMunicipality
        can [:selected], GeoBarangay
        can :crud, Cooperative
        can :crud, UrdRequirement
      end
      if user.id == 5 # VP Jack
        can [:read, :update_underwriting_status, :to_pdf], GyrtProposal
        can :crud, UrdRequirement
      end
    
    when Agent
      can [:read, :create], Agent, id: user
      can [:crud, :update_agent_coop_status, :to_pdf], GyrtProposal
      can [:read, :view, :upload_member], Member
      can [:crud, :update_agent_coop], GyrtAgreement
    end
  end
  
end