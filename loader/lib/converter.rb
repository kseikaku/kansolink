# encoding:UTF-8
# Converter Class
#2015/12/30
#S-JISの形式のファイルをUTF-8に変換して読み込む為のクラス
require 'nkf'
class Converter
  def convert(filename)
    File.open(filename) do |file|
      @contents=NKF.nkf('-w',file.read)
      @contents.gsub!('Shift_JIS','UTF-8')
      @contents.gsub!('shift_jis','UTF-8')
    end
    File.write('data/tempfile.tmp',@contents)
   return 'data/tempfile.tmp'
  end
end
