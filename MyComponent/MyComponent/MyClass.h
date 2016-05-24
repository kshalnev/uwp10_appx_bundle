#pragma once

namespace MyComponent
{
    [Windows::Foundation::Metadata::WebHostHidden]
    public ref class MyClass sealed
    {
    public:
        MyClass();
        Platform::String^ GetLocalTime();
    };
}
