class ReimplementEnumerable
  def initialize(collection)
    @collection = collection
  end

  def select
    result = []

    @collection.each do |element|
      should_select = yield(element)
      if should_select
        result << element
      end
    end

    return result
  end

  def all?
    result = []
    @collection.each do |element|
      book = yield(element)
      if book
        result << element
      end
    end
    result == @collection
  end

  def count
    result = 0
    @collection.each do |element|
      count_it = yield(element)
      if count_it
        result += 1
      end
    end
    result
  end

  def find
    result = nil
    @collection.each do |element|
      should_find = yield(element)
      if should_find
        result = element
        break
      end
    end
    result
  end

  def each_with_index
      index = 0
      @collection.each do |element|
        yield(element, index)
        index += 1
      end
    end

    def drop(book)
      count = 0
      result = []
      @collection.each do |element|
        if count >= book
          result << element
        end
        count += 1
      end
      result
    end

    def drop_while
      result = []
      @collection.each do |element|
        drop_book = yield(element)
        if drop_book
          result << element
        end
      end
      result
    end

end
