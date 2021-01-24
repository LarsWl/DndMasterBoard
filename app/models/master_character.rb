class MasterCharacter < Character
  after_create_commit { broadcast_append_to 'characters' }
end