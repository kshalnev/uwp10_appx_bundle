#include "pch.h"
#include "MyClass.h"

using namespace MyComponent;
using namespace Platform;

namespace
{
    std::wstring to_wstring(const std::string & s)
    {
        int len;
        int slength = (int)s.length() + 1;
        len = MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, 0, 0);
        std::wstring r(len, L'\0');
        MultiByteToWideChar(CP_ACP, 0, s.c_str(), slength, &r[0], len);
        return r;
    }
}

MyClass::MyClass()
{
}

String^ MyClass::GetLocalTime()
{
#pragma warning(push)
#pragma warning(disable : 4996)
    time_t t = time(nullptr);
    std::string str = asctime(localtime(&t));
#pragma warning(pop)
    return ref new String(to_wstring(str).c_str());
}
