import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/add_profile_page/view/addprofilepage.dart';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:DummyInvoice/pages/profile_page/widgets/profile_page_menu_widget.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.constants});

  final Constants? constants;

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  Constants constants=Constants();
  bool _isSearching=false;
@override
void initState()
{
  super.initState();
 WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
   context.read<ProfilePageViewmodel>().getAllPosts();
 },
 );
}

  @override
  Widget build(BuildContext context) {
    print('profileBuild');
    final profilePageViewmodel=context.watch<ProfilePageViewmodel>();
    return
    Scaffold(
      appBar: AppBar(elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).getBackColor(),
        title: _isSearching?
            TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus
                    ?.unfocus();

              },
              controller: profilePageViewmodel.searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                border:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
                  ),
              ),
              onChanged:(value) {
                profilePageViewmodel.onSearch(value);
              },
            )
            :Text(
          widget
              .constants!
              .profilePageAppBarTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
          if(_isSearching)
            {
              profilePageViewmodel.searchController.clear();
              profilePageViewmodel.onSearch("");
            setState(() {
            _isSearching=false;
            });
            }

          else{
           setState(() {
             _isSearching=true;
           });
          }
          },
        icon: Icon(
            _isSearching
                ?Icons.close
                :Icons.search),

          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          Future.delayed(Duration(seconds: 2));
          profilePageViewmodel.getAllPosts();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:StreamBuilder(
            stream: profilePageViewmodel.postsStream,
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              else if(snapshot.hasError)
                {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              else if(snapshot.hasData)
                {  final profiles= snapshot.data!;
                if(profiles.isEmpty)
                  {
                    return _buildNoDataWidget();
                  }
                  else
                  {
                    return _buildListView(profiles);
                  }
                  }else {
                return _buildNoDataWidget();
              }
            },
          ),
        ),
      ),
      floatingActionButton: _addClientButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

    );
  }
  Widget _addClientButton(
      )
  {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddProfilePage();
            },
          ),
        );
      },
      icon: CustomIconWidget(
        iconaddress: Assets.addButtonAddress,
        height: 54,
        weight: 54,
      ),
    );
  }

  Widget _buildNoDataWidget()
  {
       return Column(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(backgroundColor: Colors.white,
            radius: 60,
            child: ClipOval(
              child: Icon(
                Icons
                    .person_rounded,
                color: Colors.grey,
                size: 90,
              ),
            ),
          ),
        ),
        Text(
          LanguageManager.translate(
              'noProfileAvailableText'),
          style: TextStyle(
            color: Theme.of(
              context,
            ).getHintTextColor(),
          ),
        ),
      ],
    );
  }
  Widget _buildListView(List<Profile?> profiles)
  {
   return ListView.builder(
      padding: EdgeInsets.only(bottom: context.getWidth(65)),
      itemCount: profiles.length,
      itemBuilder: (context,
          index) {
        final currentProfile=profiles[index];
        return Padding(
          padding: const EdgeInsets
              .symmetric(
              vertical: 4.0),
          child: ListTile(
            contentPadding: EdgeInsets.only(
                top: 10,bottom: 10,left: 20,right: 5
            ),
            minLeadingWidth: 30,
            horizontalTitleGap: 5,
            dense: true,
            tileColor: Theme.of(
              context,
            ).getBottomContainerColor(),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadiusGeometry.circular(10),
              side: BorderSide(
                color: Theme.of(
                  context,
                ).getTextColor().withValues(alpha: 0.2),
              ),
            ),
            title: Text('${currentProfile!.id}',maxLines: 1,textAlign: TextAlign.center,),
            subtitle: Text('${currentProfile.title}',maxLines: 1,),
            titleAlignment: ListTileTitleAlignment.center ,
            style: ListTileStyle.drawer,
            trailing: ProfileMenuWidget(
              id: currentProfile.id,constants: constants,),
          ),
        );
      },
    );
  }
}


