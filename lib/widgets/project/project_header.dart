/*
  Copyright (C) 2021 - 2023 Joshua Wade

  This file is part of Anthem.

  Anthem is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Anthem is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Anthem. If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:anthem/helpers/id.dart';
import 'package:anthem/theme.dart';
import 'package:anthem/widgets/basic/button.dart';
import 'package:anthem/widgets/basic/menu/menu.dart';
import 'package:anthem/widgets/basic/menu/menu_model.dart';
import 'package:anthem/widgets/main_window/main_window_controller.dart';
import 'package:anthem/widgets/project/project_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../basic/icon.dart';

class ProjectHeader extends StatelessWidget {
  final ID projectID;

  const ProjectHeader({Key? key, required this.projectID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = MenuController();
    final mainWindowController = context.read<MainWindowController>();
    final projectController = context.read<ProjectController>();

    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(4),
        ),
        color: Theme.panel.accent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          children: [
            Menu(
              menuController: menuController,
              menuDef: MenuDef(
                children: [
                  AnthemMenuItem(
                      text: "New project",
                      onSelected: () {
                        final projectID = mainWindowController.newProject();
                        mainWindowController.switchTab(projectID);
                      }),
                  AnthemMenuItem(
                      text: "Load project...",
                      onSelected: () {
                        mainWindowController.loadProject().then((projectID) {
                          if (projectID != null) {
                            mainWindowController.switchTab(projectID);
                          }
                        });
                      }),
                  Separator(),
                  AnthemMenuItem(
                      text: "Save",
                      onSelected: () {
                        mainWindowController.saveProject(projectID, false);
                      }),
                  AnthemMenuItem(
                      text: "Save as...",
                      onSelected: () {
                        mainWindowController.saveProject(projectID, true);
                      }),
                ],
              ),
              child: Button(
                // width: 28,
                startIcon: Icons.hamburger,
                showMenuIndicator: true,
                onPress: () {
                  menuController.open?.call();
                },
              ),
            ),
            const SizedBox(width: 4),
            Button(
              // width: 28,
              startIcon: Icons.save,
              onPress: () {
                mainWindowController.saveProject(projectID, false);
              },
            ),
            const SizedBox(width: 4),
            Button(
              // width: 28,
              startIcon: Icons.undo,
              onPress: () {
                projectController.undo();
              },
            ),
            const SizedBox(width: 4),
            Button(
              // width: 28,
              startIcon: Icons.redo,
              onPress: () {
                projectController.redo();
              },
            ),
          ],
        ),
      ),
    );
  }
}
