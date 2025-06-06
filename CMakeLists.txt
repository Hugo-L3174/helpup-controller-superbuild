# Libs ===============================
AddProject(Stabiliplus
  GITE mc-controllers/stabiliplus
  GIT_TAG origin/topic/Optimize
  APT_DEPENDENCIES libeigen3-dev libglpk-dev libtinyxml2-dev libtbb-dev
)

AddProject(gram_savitzky_golay
  GITHUB jrl-umi3218/gram_savitzky_golay
  GIT_TAG origin/master
)

# Plugins ===============================
AddProject(mc_force_shoe_plugin
  GITHUB Hugo-L3174/mc_force_shoe_plugin
  GIT_TAG origin/main
  DEPENDS mc_rtc
)

include(mtsdk.cmake)

AddProject(xsens_streaming
  GITHUB arntanguy/xsens_streaming
  GIT_TAG origin/main
  CMAKE_ARGS -DMTSDK_PREFIX=${CMAKE_INSTALL_PREFIX}/mtsdk
)

AddProject(mc_xsens_plugin
  GITHUB Hugo-L3174/mc_xsens_plugin
  GIT_TAG origin/main
  DEPENDS mc_rtc xsens_streaming
)

AddProject(mc_robot_model_update
  GITHUB Hugo-L3174/mc_robot_model_update
  GIT_TAG origin/main
  DEPENDS mc_rtc
)

AddProject(mc_udp
  GITHUB arntanguy/mc_udp
  GIT_TAG origin/topic/UDPPlugin
  DEPENDS mc_rtc
  CMAKE_ARGS -DBUILD_OPENRTM_SERVER=OFF
)

# Robot modules ===============================

# Human model
AddCatkinProject(human_description
  GITE hlefevre/human_description
  GIT_TAG origin/master
  WORKSPACE data_ws
)

AddProject(mc_human
  GITE hlefevre/mc_human
  GIT_TAG origin/master
  DEPENDS human_description mc_rtc
)

# Panda for torso emulation live
AddProject(libfranka
  GITHUB arntanguy/libfranka # using arnaud's fork (tag 0.9.2 does not exist anymore on emika's repo)
  GIT_TAG origin/master
  CMAKE_ARGS -DBUILD_TESTS=OFF
  APT_DEPENDENCIES libpoco-dev libeigen3-dev libfmt-dev
)

AddProject(mc_panda
  GITHUB jrl-umi3218/mc_panda
  GIT_TAG origin/master
  DEPENDS mc_rtc libfranka
)

AddProject(mc_franka
  GITHUB arntanguy/mc_franka
  GIT_TAG origin/topic/FixTimestepThread
  DEPENDS libfranka mc_rtc mc_panda
)

# Controller ===============================
AddProject(helpupcontroller
  GITE hlefevre/helpupcontroller
  GIT_TAG origin/master
  DEPENDS Stabiliplus gram_savitzky_golay mc_state_observation mc_human mc_panda mc_robot_model_update mc_force_shoe_plugin mc_xsens_plugin mc_udp
)
