class AddInstitutionIdToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :institution_id, :integer
    add_column :educations, :education_type_id, :integer
  end
end
