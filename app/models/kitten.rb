# frozen_string_literal: true

# == Schema Information

# Table name: kittens

# id                   :integer
# name                 :string
# cuteness             :integer
# softness             :integer
# created_at           :datetime
# updated_at           :datetime

class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, prescence: true
end
