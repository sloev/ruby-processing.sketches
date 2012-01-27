# Test1

class Test1 < Processing::App
  
  #load_library 'jsyphon'
  #import 'jsyphon'
  load_java_library "opengl"
  load_library "jsyphon"
  include_package "processing.opengl"
  include_package "javax.media.opengl"
  import "jsyphon"
  

  def setup
    mysyphon = JSyphonServer
    render_mode OPENGL
    pgl = g
    gl = pgl.gl
    
    mysyphon = JSyphonServer.new
    mysyphon.test
    mysyphon.initWithName("processing")
    
    #pgl.beginGL
    #pgl.endGL
    
    #pgl = PGraphicsOpenGL g
    #initSyphon(gl,"processing")
  end
  
  def draw

    if (library_loaded? :Syphon)
      ellipse(width/2,height/2,width,height)
    end
  end
  
end

Test1.new :title => "Test1", :width => 800, :height => 600