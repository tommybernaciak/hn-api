class NotebooksCreator

  def initialize(title)
    @title = title
  end

  def call
    create
  end

  private

  attr_reader :title

  def create
    SearchNoteBook.create(title: title)
  end
end

