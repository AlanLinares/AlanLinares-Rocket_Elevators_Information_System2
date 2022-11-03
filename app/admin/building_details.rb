ActiveAdmin.register BuildingDetail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :building_id, :number_of_floors, :building_type, :architecture, :max_occupancy, :construction_year
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_id, :number_of_floors, :building_type, :architecture, :max_occupancy, :construction_year]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
