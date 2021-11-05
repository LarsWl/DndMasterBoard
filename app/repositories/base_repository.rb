class BaseRepository
  attr_reader :model_class

  def find(id)
    @model_class.find(id)
  end

  def where(**args)
    @model_class.where(args)
  end

  def find_by(**args)
    @model_class.find_by(args)
  end

  def create(*args)
    @model_class.create(args)
  end

  def destroy
    @model_class.destroy
  end

  def update(**args)
    @model_class.update(args)
  end

  def includes(*args)
    @model_class.includes(args)
  end
end