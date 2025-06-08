AptInstall(sharutils)

if(NOT EXISTS ${CMAKE_INSTALL_PREFIX}/mtsdk)
  set (MTSDK_URL "https://seafile.lirmm.fr/f/939fca55b4b545cab11a/?dl=1")
  message(STATUS "MTSDK -- Downloading SDK archive")
  DownloadFile("${MTSDK_URL}" "${CMAKE_CURRENT_BINARY_DIR}/mtsdk/mtsdk.tar.gz" "")
  file(ARCHIVE_EXTRACT
        INPUT "${CMAKE_CURRENT_BINARY_DIR}/mtsdk/mtsdk.tar.gz"
        DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/mtsdk"
  )
  message(STATUS "MTSDK - Archive extracted to ${CMAKE_CURRENT_BINARY_DIR}/mtsdk")

  set(MTSDK_INSTALL_COMMAND "")
  if(${USE_SUDO})
    set(MTSDK_INSTALL_COMMAND "echo -e ${CMAKE_INSTALL_PREFIX}/mtsdk | ${SUDO_CMD} ./mtsdk_linux-x64_2025.0.sh")
  else()
    set(MTSDK_INSTALL_COMMAND "echo -e ${CMAKE_INSTALL_PREFIX}/mtsdk | ./mtsdk_linux-x64_2025.0.sh")
  endif()
  message(STATUS "MTSDK - install command is: ${MTSDK_INSTALL_COMMAND}")

  execute_process(
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mtsdk/MT_Software_Suite_linux-x64_2025.0
    COMMAND bash -c "${MTSDK_INSTALL_COMMAND}"
    OUTPUT_VARIABLE output
    ERROR_VARIABLE error_output
    RESULT_VARIABLE result
    COMMAND_ERROR_IS_FATAL ANY
  )

  if(EXISTS ${CMAKE_INSTALL_PREFIX}/mtsdk)
    message(STATUS "MTSDK - Installed to ${CMAKE_INSTALL_PREFIX}/mtsdk")
  else()
    message(STATUS "MTSDK - result: ${result}")
    message(STATUS "MTSDK - output: ${output}")
    message(STATUS "MTSDK - error: ${error_output}")
    message(FATAL_ERROR "MTSDK - failed to install")
  endif()
else()
  message(STATUS "MTSDK is already installed in ${CMAKE_INSTALL_PREFIX}/mtsdk (delete this folder to re-install)")
endif()
