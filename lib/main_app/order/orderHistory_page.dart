import 'package:flutter/material.dart';
import 'package:melar/main_app/bookmark_page.dart';
import 'package:melar/main_app/cart_page.dart';
import 'package:melar/main_app/home_page.dart';
import 'package:melar/main_app/account_page.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.green),
              const SizedBox(width: 8),
              const Text(
                'Order History',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 0,
          leading: const SizedBox(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: TabBar(
              isScrollable: true, // Allow tab scrolling when space is not enough
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              indicatorWeight: 2.0,
              tabs: const [
                Tab(text: 'Belum Dibayar'),
                Tab(text: 'Dikemas'),
                Tab(text: 'Dikirim'),
                Tab(text: 'Dikembalikan'),
                Tab(text: 'Selesai'),
              ],
              // Menambahkan padding hanya di sebelah kanan
              padding: EdgeInsets.zero, 
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList('Belum Dibayar'),
            _buildOrderList('Dikemas'),
            _buildOrderList('Dikirim'),
            _buildOrderList('Dikembalikan'),
            _buildOrderList('Selesai'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3, // Index untuk halaman OrderHistory
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BookmarkPage()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } else if (index == 3) {
              // Tetap di halaman Order History
            } else if (index == 4) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(String status) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildOrderItem(
            title: 'Order #12345',
            description: 'Description of the order with status: $status',
            date: '2025-01-09',
            status: status,
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            title: 'Order #12346',
            description: 'Description of another order with status: $status',
            date: '2025-01-08',
            status: status,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String description,
    required String date,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                status,
                style: TextStyle(
                  color: _getStatusColor(status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Belum Dibayar':
        return Colors.red;
      case 'Dikemas':
        return Colors.orange;
      case 'Dikirim':
        return Colors.blue;
      case 'Dikembalikan':
        return Colors.purple;
      case 'Selesai':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}