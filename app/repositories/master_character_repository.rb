class MasterCharacterRepository < BaseRepository
  def initialize
    @model_class = MasterCharacter
  end

  def user_master_characters(user)
    where(user_id: user.id)
  end
end