class CuponSerializer < ApplicationSerializer
    attributes  :id,
                :code,
                :average,
                :total,
                :updated_at,
                :created_at
  end
  