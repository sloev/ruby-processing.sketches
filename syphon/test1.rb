# Test1

class Test1 < Processing::App
  
  #load_library 'jsyphon'
  #import 'jsyphon'
  load_java_library "opengl"
  load_library "jsyphon"
  include_package "processing.opengl"
  include_package "javax.media.opengl"
  import "jsyphon"
  
 
  #xmysyphon = JSyphonServer
  def setup
    mysyphon = JSyphonServer
    render_mode OPENGL
    
    #pgl = PGraphicsOpenGL g
    #initSyphon(gl,"processing")
  end
  
  def draw
    pgl = g
    gl = pgl.gl
    pgl.beginGL
    if (library_loaded? :Syphon)
      ellipse(width/2,height/2,width,height)
    end
  end
  
end

Test1.new :title => "Test1", :width => 800, :height => 600