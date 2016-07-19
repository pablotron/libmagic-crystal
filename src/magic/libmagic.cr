module Magic
  @[Link("magic")]
  lib LibMagic
    type MagicT = UInt8*

    enum Flags
      NONE = 0x000000 # No flags
      DEBUG = 0x000001 # Turn on debugging
      SYMLINK = 0x000002 # Follow symlinks
      COMPRESS = 0x000004 # Check inside compressed files
      DEVICES = 0x000008 # Look at the contents of devices
      MIME_TYPE = 0x000010 # Return the MIME type
      CONTINUE = 0x000020 # Return all matches
      CHECK = 0x000040 # Print warnings to stderr
      PRESERVE_ATIME = 0x000080 # Restore access time on exit
      RAW = 0x000100 # Don't translate unprintable chars
      ERROR = 0x000200 # Handle ENOENT etc as real errors
      MIME_ENCODING = 0x000400 # Return the MIME encoding
      MIME = 0x000010 | 0x000400 # (MIME_TYPE|MIME_ENCODING)
      APPLE = 0x000800 # Return the Apple creator and type

      NO_CHECK_COMPRESS = 0x001000 # Don't check for compressed files
      NO_CHECK_TAR = 0x002000 # Don't check for tar files
      NO_CHECK_SOFT = 0x004000 # Don't check magic entries
      NO_CHECK_APPTYPE = 0x008000 # Don't check application type
      NO_CHECK_ELF = 0x010000 # Don't check for elf details
      NO_CHECK_TEXT = 0x020000 # Don't check for text files
      NO_CHECK_CDF = 0x040000 # Don't check for cdf files
      NO_CHECK_TOKENS = 0x100000 # Don't check tokens
      NO_CHECK_ENCODING = 0x200000 # Don't check text encodings
    end

    fun magic_open(
      flags     : UInt32
    ) : MagicT

    fun magic_close(
      magic     : MagicT
    ) : Void

    fun magic_error(
      magic     : MagicT
    ) : UInt8*

    fun magic_errno(
      magic     : MagicT
    ) : Int32

    fun magic_file(
      magic     : MagicT,
      filename  : UInt8*
    ) : UInt8*

    fun magic_buffer(
      magic     : MagicT,
      buf       : UInt8*,
      buf_len   : UInt32 # FIXME: actually size_t
    ) : UInt8*

    fun magic_setflags(
      magic     : MagicT,
      flags : UInt32
    ) : Int32

    fun magic_check(
      magic     : MagicT,
      filename  : UInt8*
    ) : Int32

    fun magic_compile(
      magic     : MagicT,
      filename  : UInt8*
    ) : Int32

    fun magic_load(
      magic     : MagicT,
      filename  : UInt8*
    ) : Int32
  end
end
