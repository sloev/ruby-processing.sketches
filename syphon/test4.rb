# Test1

class Test1 < Processing::App
  
  #load_library 'jsyphon'
  #import 'jsyphon'
  load_java_library "opengl"
  load_library "jsyphon"
  load_library "GLGraphics"
  include_package "processing.opengl"
  include_package "javax.media.opengl"
  include_package "codeanticode.glgraphics"
  import "jsyphon"
  
  $mySyphon = JSyphonServer
  $gloff = GLGraphicsOffScreen
  def initSyphon(gl, theName)
    if($mySyphon.nil?) 
      $mySyphon.stop
    end
    $mySyphon = JSyphonServer.new
    $mySyphon.test()
    $mySyphon.initWithName(theName)

    #copy to texture, to send to Syphon.

  end

  def setup
    size(300, 300, GLConstants.GLGRAPHICS)
    # If your video card isn't up to it use following (no antialias)
    #@canvas = GLGraphicsOffScreen.new(self, width, height)    
    @canvas = GLGraphicsOffScreen.new(self, width, height, true, 4)
    #render_mode OPENGL
    pgl = g
    gl = pgl.gl
    
    initSyphon(gl,"processing")
    
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