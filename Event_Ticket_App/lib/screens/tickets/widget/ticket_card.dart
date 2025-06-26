import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/models/ticket_model.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final VoidCallback onTap;

  const TicketCard({super.key, required this.ticket, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final event = ticket.event;
    if (event == null) return const SizedBox.shrink();

    final eventDate = DateTime.parse(event.eventDate);
    final formattedDate = DateFormat('MMM dd, yyyy').format(eventDate);
    final formattedTime = DateFormat('HH:mm').format(eventDate);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$formattedDate • $formattedTime',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  event.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  event.location,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    onTap.call();
                  },
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ), // Set text color as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: event.imageUrl!,
              height: 150,
              width: 130,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 150,
                width: 130,
                color: Colors.grey[300],
                child: const Icon(Icons.image),
              ),
              errorWidget: (context, url, error) => Container(
                height: 150,
                width: 130,
                color: Colors.grey[300],
                child: const Icon(Icons.event),
              ),
            ),
          )
        ],
      ),
    );
  }
}
