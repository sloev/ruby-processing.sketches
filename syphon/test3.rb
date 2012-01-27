# Test1

class Test1 < Processing::App
  
  #load_library 'jsyphon'
  #import 'jsyphon'
  load_java_library "opengl"
  load_library "jsyphon"
  include_package "processing.opengl"
  include_package "javax.media.opengl"
  import "jsyphon"
  
  $mySyphon = JSyphonServer
  def initSyphon(gl, theName)
    if($mySyphon.nil?) 
      $mySyphon.stop
    end
    $mySyphon = JSyphonServer.new
    $mySyphon.test()
    $mySyphon.initWithName(theName)

    #copy to texture, to send to Syphon.
    texID=Array.new(1)
    gl.glGenTextures(3)
    gl.glBindTexture(gl.GL_TEXTURE_RECTANGLE_EXT, texID)
    gl.glTexImage2D(gl.GL_TEXTURE_RECTANGLE_EXT, 0, gl.GL_RGBA8, width, height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, nil?)
  end

  def setup
    render_mode OPENGL
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