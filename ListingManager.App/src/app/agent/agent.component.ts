import { Component, OnInit } from '@angular/core';

import { IAgent } from './agent';
import { AppService } from '../app.service';

import { Observable } from 'rxjs/Observable';

@Component({
  selector: 'app-agent',
  templateUrl: './agent.component.html',
  providers: [ AppService ]
})
export class AgentComponent implements OnInit {
    pageTitle: string = 'Agents';
    listFilter: string;
    errorMessage: string;
    actionTitle: string = "Add New Agent";
    inputAgentId: number;
    inputAgentName: string;

    agents: IAgent[];
    selectedAgent: IAgent;
    selectedAgentId: number;

    constructor(private _appService: AppService) {

    }

    ngOnInit(): void {
      this.loadAgents();
    }

    loadAgents() {
        this._appService.getAgents()
                .subscribe(agents => this.agents = agents,
                           error => this.errorMessage = <any>error);
    }

    onEditClicked(id: number, agent: IAgent): void {
      this.actionTitle = "Edit Agent";
      this.selectedAgent = agent;
      this.selectedAgentId = agent.AgentId;
      this.inputAgentId = agent.AgentId;
      this.inputAgentName = agent.AgentName;
    }

    onDeleteClicked(id: number): void {
      this.actionTitle = "Delete";
      this.selectedAgentId = id;

      this.onSaveClicked('');
    }

    onSaveClicked(message: string): void {
      this.pageTitle = 'Agents: ' + message;

      if (this.actionTitle.startsWith("Edit")) {
        this.selectedAgent.AgentName =  this.inputAgentName;
        this._appService.updateAgent(this.selectedAgentId, this.selectedAgent)
          .subscribe(data => {
              // refresh the list
              this.loadAgents();
              return true;
            },
            error => {
              console.error("Error updating agent!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Add")) {
        this.selectedAgent = { AgentId: 0, AgentName: this.inputAgentName, ListingCount: 0 };

        this._appService.addAgent(this.selectedAgent)
          .subscribe(data => {
              // refresh the list
              this.loadAgents();
              return true;
            },
            error => {
              console.error("Error adding agent!");
              return Observable.throw(error);
            }
          );
      }
      else if (this.actionTitle.startsWith("Delete")) {
        this._appService.deleteAgent(this.selectedAgentId)
          .subscribe(data => {
              // refresh the list
              this.loadAgents();
              return true;
            },
            error => {
              console.error("Error deleting agent!");
              return Observable.throw(error);
            }
          );
      }

      this.actionTitle = "Add New Agent";
      this.inputAgentId = 0;
      this.inputAgentName = "";
      this.loadAgents();
    }
}
