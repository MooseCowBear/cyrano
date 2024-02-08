module WriterHelper
  def title(writing_sample)
    if writing_sample.title.blank?
      "Untitled"
    else
      writing_sample.title
    end
  end
end
