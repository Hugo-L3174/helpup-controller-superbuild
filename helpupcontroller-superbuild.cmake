# Libs ===============================
AddProject(Stabiliplus
  GITE mc-controllers/stabiliplus
  GIT_TAG origin/topic/Optimize
  APT_PACKAGES libeigen3-dev libglpk-dev libtinyxml2-dev
)

AddProject(gram_savitzky_golay
  GITHUB arntanguy/gram_savitzky_golay
  GIT_TAG origin/master
)

# Plugins ===============================
AddProject(mc_force_shoe_plugin
  GITHUB Hugo-L3174/mc_force_shoe_plugin
  GIT_TAG origin/main
  DEPENDS mc_rtc
)

AddProject(xsens_streaming
  GITHUB arntanguy/xsens_streaming
  GIT_TAG origin/main
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
  GITHUB frankaemika/libfranka
  GIT_TAG origin/0.8.0
)

AddCatkinProject(franka_ros
  GITHUB frankaemika/franka_ros
  GIT_TAG origin/0.8.1
  WORKSPACE mc_rtc_ws
  DEPENDS libfranka
)

AddProject(mc_panda
  GITHUB jrl-umi3218/mc_panda
  GIT_TAG origin/master
  DEPENDS mc_rtc libfranka franka_ros
)

# Controller ===============================
AddProject(helpupcontroller
  GITE hlefevre/helpupcontroller
  GIT_TAG origin/master
  DEPENDS Stabiliplus gram_savitzky_golay mc_human mc_panda mc_robot_model_update mc_force_shoe_plugin mc_xsens_plugin mc_udp
)