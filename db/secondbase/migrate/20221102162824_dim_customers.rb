class DimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table DimCustomers
    #integer  Creation Date
    "t.string" Company Name
    "t.string" Full Name of the companys Main ContactId
    "t.string" Email of the companys main contact 
    "t.string" NbElevators
    "t.string" Customer's city 
  end
end
