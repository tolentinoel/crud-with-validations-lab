class Song < ApplicationRecord
    validate :release_yr_validation
    validates :title, presence: true, uniqueness: true
    validates :release_year, presence: true, if: :released?
    validates :artist_name, presence: true

    def release_yr_validation
        if release_year.present? && release_year > Time.now.year
            errors.add(:release_year, "release year can't be in the future")
        end

    end

    # is valid without release year when released is false (FAILED - 1)
    # is invalid when the release year is in the future (FAILED - 2)
end
