//
//  Application.h
//  Walnut
//
//  Created by Anton Nadtoka on 22.11.2017.
//

#ifndef __WALNUT_APPLICATION_H
#define __WALNUT_APPLICATION_H

namespace walnut {
    
    class Application
    {
    private:
        
    protected:
        virtual void onResize(int width, int height);
        virtual void onDraw();
        virtual void onMouseDown(int x, int y);
        virtual void onMouseMove(int x, int y);
        virtual void onMouseUp(int x, int y);
        
    public:
        Application();
        ~Application();
    };
    
}

#endif
