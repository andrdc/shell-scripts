#!/bin/bash

# Execute system information program and launch firefox with the info page

system_information > .systemInfoPage.html
firefox .systemInfoPage.html
