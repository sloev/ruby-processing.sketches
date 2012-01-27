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
  

  #$c = GLGraphicsOffScreen
  #$t = GLTexture

  def setup
    $name = "processing"

    $mySyphon = JSyphonServer
    size(300, 300, GLConstants.GLGRAPHICS)
    # If your video card isn't up to it use following (no antialias)
    #@canvas = GLGraphicsOffScreen.new(self, width, height)    
    $c = GLGraphicsOffScreen.new(self, width, height, true, 4)
    $t = GLTexture.new(self)
    initSyphon($c.gl)
    $xx = 0
    $yy = 0
    
    #pgl.beginGL
    #pgl.endGL
    
    #pgl = PGraphicsOpenGL g
    #initSyphon(gl,"processing")
    
    $c.beginDraw()
    $c.clear(255,0,0,0)
    $c.endDraw()
  end
  
  def draw
    $xx = $xx ++ 1
    $yy = $yy ++ 3
    if($xx>50)
      $xx=0
    end
    if($yy>50)
      $yy=0
    end
    $c.beginDraw()
    #$c.clear(255,0,0,0)
    $c.line(0,0,100,100)
    $c.fill(255,255,0,255)
    $c.ellipse(width-50-$xx,height-50-$yy,100,100)
    $c.endDraw()
    $t = $c.getTexture()
    image($t,0,0)
    $mySyphon.publishFrameTexture($t.getTextureID(),$t.getTextureTarget(),0,0,width,height,width,height,true)
  end
  
  def initSyphon(gl)
    if($mySyphon.nil?) 
      $mySyphon.stop
    end
    $mySyphon = JSyphonServer.new
    #$mySyphon.test()
    $mySyphon.initWithName(name)
  end
  
end

Test1.new :title => "Test1", :width => 800, :height => 600