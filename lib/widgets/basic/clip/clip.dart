/*
  Copyright (C) 2022 Joshua Wade

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

import 'package:anthem/widgets/basic/clip/clip_cubit.dart';
import 'package:anthem/widgets/basic/clip/clip_notes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clip extends StatelessWidget {
  const Clip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClipCubit, ClipState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 15,
            decoration: const BoxDecoration(
              color: Color(0xFFA15D5B),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(3),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              state.pattern.name,
              style: const TextStyle(
                color: Color(0xFFFFD7D6),
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Color(0x66A15D5B),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(3),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: ClipNotes(
                    color: const Color(0xFFEEA0A2),
                    timeViewStart: 0,
                    ticksPerPixel: 5,
                    notes: state.pattern.notes.entries
                        .expand((e) => e.value)
                        .map((note) => ClipNoteModel.fromNoteModel(note))
                        .toList(),
                  ),
                )),
          ),
        ],
      );
    });
  }
}
