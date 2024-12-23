# helpup-controller-superbuild

This repository is an extension repository for [mc-rtc-superbuild](https://github.com/mc-rtc/mc-rtc-superbuild)

It builds:

- All computation dependencies of the helpupcontroller
- All required robot modules (human model and panda arm for torso emulation)
- All required plugins (force shoes, xsens, mc_udp for dual robot control with panda)
- The helpupcontroller itself

Usage
--

```bash
git clone https://github.com/mc-rtc/mc-rtc-superbuild
git clone git@github.com:Hugo-L3174/helpup-controller-superbuild.git mc-rtc-superbuild/extensions/helpup-controller-superbuild
cmake -S mc-rtc-superbuild -B mc-rtc-superbuild/build -DSOURCE_DESTINATION=$HOME/devel/src -DBUILD_DESTINATION=$HOME/devel/build 
cmake --build mc-rtc-superbuild/build --config RelWithDebInfo
```