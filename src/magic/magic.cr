class Magic::Magic
  def initialize(
    flags   : Int32 = LibMagic::Flags::MIME,
    db_path : String? = nil
  )
    @closed = false
    @magic = LibMagic.magic_open(flags)
    raise "magic_open() failed" unless @magic

    # load database
    load(db_path)
  end

  def self.get_mime_type(path : String)
    magic = new
    r = magic.file(path)
    magic.close

    # return result
    r
  end

  private def load(path : String? = nil) : Void
    err = LibMagic.magic_load(@magic, nil)
    raise "magic_load() failed: " + error if err != 0
  end

  def file(path : String) : String
    raise "closed" if closed?
    r = LibMagic.magic_file(@magic, path)
    raise "magic_file() failed: " + error unless r
    String.new(r)
  end

  def close
    raise "closed" if closed?
    LibMagic.magic_close(@magic)
    @closed = true
  end

  def closed?
    @closed
  end

  def error : String
    raise "closed" if closed?
    String.new(LibMagic.magic_error(@magic))
  end
end
